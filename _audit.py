import yaml
with open('roadmap.yaml') as f:
    data = yaml.safe_load(f)
phases = data.get('phases', [])
total = len(phases)
done = sum(1 for p in phases if p.get('status') == 'complete')
in_progress = sum(1 for p in phases if p.get('status') == 'in_progress')
planned = sum(1 for p in phases if p.get('status') == 'planned')
todo = sum(1 for p in phases if p.get('status') == 'todo')
superseded = sum(1 for p in phases if p.get('status') == 'superseded')
deferred = sum(1 for p in phases if p.get('status') == 'deferred')
print('Total phases:', total)
print('Complete:', done)
print('In progress:', in_progress)
print('Planned:', planned)
print('Todo:', todo)
print('Superseded:', superseded)
print('Deferred:', deferred)
total_delivs = 0
done_delivs = 0
for p in phases:
    for d in p.get('deliverables', []):
        total_delivs += 1
        if d.get('status') == 'done':
            done_delivs += 1
print('Total deliverables:', total_delivs)
print('Done deliverables:', done_delivs)
total_tasks = 0
done_tasks = 0
for p in phases:
    for d in p.get('deliverables', []):
        for ac in d.get('acceptance_criteria', []):
            total_tasks += 1
            if ac.get('met'):
                done_tasks += 1
print('Total tasks:', total_tasks)
print('Done tasks:', done_tasks)
print('---')
for p in phases:
    s = p.get('status')
    if s not in ('complete', 'superseded', 'deferred'):
        print(p['id'], s, '-', p.get('title', ''))
