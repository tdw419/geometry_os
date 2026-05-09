; DESCRIPTION: Composite: . Then Renders a yellow box of size 98x81 starting at (120, 27). Then Places a cyan line segment connecting (67, 153) to (102, 244).
; PLAN: r0=120(x), r1=27(y), r2=98(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x1), r1=153(y1), r2=102(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 98x81 starting at (120, 27).
; PLAN: r0=120(x), r1=27(y), r2=98(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 27
LDI r2, 98
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (67, 153) to (102, 244).
; PLAN: r0=67(x1), r1=153(y1), r2=102(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 153
LDI r2, 102
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
