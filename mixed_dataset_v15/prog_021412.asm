; DESCRIPTION: Composite: Sets a single green pixel at (362, 163) then Renders a cyan box of size 39x68 starting at (442, 177).
; PLAN: r0=362(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=177(y), r7=39(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 442
LDI r6, 177
LDI r7, 39
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
