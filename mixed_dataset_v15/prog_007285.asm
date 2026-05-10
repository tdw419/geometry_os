; DESCRIPTION: Composite: Renders a white line between points (65, 39) and (416, 227) then Places a red 109x81 rectangle at position (138, 77).
; PLAN: r0=65(x1), r1=39(y1), r2=416(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=77(y), r7=109(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 39
LDI r2, 416
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 77
LDI r7, 109
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
