; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (120, 49) spanning 76 by 29 pixels. Then Places a cyan line segment connecting (103, 27) to (141, 59).
; PLAN: r0=120(x), r1=49(y), r2=76(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x1), r1=27(y1), r2=141(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (120, 49) spanning 76 by 29 pixels.
; PLAN: r0=120(x), r1=49(y), r2=76(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 49
LDI r2, 76
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (103, 27) to (141, 59).
; PLAN: r0=103(x1), r1=27(y1), r2=141(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 27
LDI r2, 141
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
