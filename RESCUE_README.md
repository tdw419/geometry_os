# geometry_os rung0 rescue

Source repo object store is hollow; git commit mechanically blocked
(stale cache-tree in index triggers lazy-fetch of objects GitHub cannot serve).
This repo preserves the rung-0 landed state + forensic manifest.

- sick repo HEAD at capture: febf1ad7137525ab25e2c21addec4674fb40319c (master, 2026-07-18)
- remote master tip: 553c9871 (2026-06-13, server-side broken: parent 'not our ref')
- remote default branch: main @ 1595e98c (2026-06-05, only 3 commits, unrelated)
- full tracked-path manifest: MANIFEST_sick_repo_tracked_paths.txt
- raw index snapshot: sick_repo_index_snapshot.bin
