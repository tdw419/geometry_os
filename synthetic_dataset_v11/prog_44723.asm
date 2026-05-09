; DESCRIPTION: Composite: . Then Renders a orange box of size 54x25 starting at (148, 177). Then Renders a magenta line between points (241, 245) and (138, 218).
; PLAN: r0=148(x), r1=177(y), r2=54(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=241(x1), r1=245(y1), r2=138(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 54x25 starting at (148, 177).
; PLAN: r0=148(x), r1=177(y), r2=54(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 177
LDI r2, 54
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (241, 245) and (138, 218).
; PLAN: r0=241(x1), r1=245(y1), r2=138(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 245
LDI r2, 138
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
