; DESCRIPTION: Composite: Sets a single red pixel at (400, 221) then Renders a cyan box of size 96x28 starting at (40, 204).
; PLAN: r0=400(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=204(y), r7=96(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 221
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 40
LDI r6, 204
LDI r7, 96
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
