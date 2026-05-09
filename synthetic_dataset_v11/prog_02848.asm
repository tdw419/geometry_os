; DESCRIPTION: Composite: . Then Creates a red rectangular region at (60, 158) spanning 69 by 36 pixels. Then Renders a magenta line between points (1, 225) and (177, 139).
; PLAN: r0=60(x), r1=158(y), r2=69(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x1), r1=225(y1), r2=177(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (60, 158) spanning 69 by 36 pixels.
; PLAN: r0=60(x), r1=158(y), r2=69(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 158
LDI r2, 69
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (1, 225) and (177, 139).
; PLAN: r0=1(x1), r1=225(y1), r2=177(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 225
LDI r2, 177
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
