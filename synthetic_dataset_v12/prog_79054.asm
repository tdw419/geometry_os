; DESCRIPTION: Composite: Renders a green box of size 52x24 starting at (454, 187) then Places a blue dot at position (403, 46).
; PLAN: r0=454(x), r1=187(y), r2=52(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=46(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 187
LDI r2, 52
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 46
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
