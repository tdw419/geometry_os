
## Addendum (same day, post-receipt)

Commit-onto-healed-tree was attempted and is mechanically blocked one level
deeper than the hollow objects: the repo's index carries a stale cache-tree
extension pointing at pre-rewrite trees; git commit and even git write-tree
trigger a promisor lazy-fetch of objects GitHub cannot serve ('not our ref').
Fix = rebuild the index (restructure decision — surfaced to Jericho, not
self-executed). This rescue branch (additive-only push; master/main
untouched, verified by ls-remote) preserves the landed rung-0 state
pending that decision. Server findings: master stale (2026-06-13) AND
server-side broken (tip parent 'not our ref'); main = 3 unrelated commits.
