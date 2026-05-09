; DESCRIPTION: Composite: . Then Creates a green rectangular region at (1, 92) spanning 39 by 53 pixels. Then Places a cyan line segment connecting (202, 119) to (84, 146).
; PLAN: r0=1(x), r1=92(y), r2=39(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=202(x1), r1=119(y1), r2=84(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (1, 92) spanning 39 by 53 pixels.
; PLAN: r0=1(x), r1=92(y), r2=39(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 92
LDI r2, 39
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (202, 119) to (84, 146).
; PLAN: r0=202(x1), r1=119(y1), r2=84(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 119
LDI r2, 84
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
