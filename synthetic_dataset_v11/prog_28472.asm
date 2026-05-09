; DESCRIPTION: Composite: . Then Places a green 114x23 rectangle at position (141, 189). Then Renders a red line between points (242, 239) and (3, 177).
; PLAN: r0=141(x), r1=189(y), r2=114(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=242(x1), r1=239(y1), r2=3(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 114x23 rectangle at position (141, 189).
; PLAN: r0=141(x), r1=189(y), r2=114(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 189
LDI r2, 114
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (242, 239) and (3, 177).
; PLAN: r0=242(x1), r1=239(y1), r2=3(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 239
LDI r2, 3
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
