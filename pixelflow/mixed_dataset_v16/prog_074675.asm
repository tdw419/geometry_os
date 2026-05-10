; DESCRIPTION: Composite: Places a purple dot at position (317, 105) then Renders a black box of size 59x35 starting at (401, 215).
; PLAN: r0=317(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=215(y), r7=59(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 215
LDI r7, 59
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
