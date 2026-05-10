; DESCRIPTION: Composite: Places a blue 52x23 rectangle at position (373, 208) then Renders a green line between points (212, 35) and (382, 209).
; PLAN: r0=373(x), r1=208(y), r2=52(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=35(y1), r7=382(x2), r8=209(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 208
LDI r2, 52
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 35
LDI r7, 382
LDI r8, 209
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
