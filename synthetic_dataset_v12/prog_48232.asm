; DESCRIPTION: Composite: Renders a red line between points (218, 37) and (202, 177) then Renders a black box of size 33x61 starting at (264, 120).
; PLAN: r0=218(x1), r1=37(y1), r2=202(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=120(y), r7=33(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 37
LDI r2, 202
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 120
LDI r7, 33
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
