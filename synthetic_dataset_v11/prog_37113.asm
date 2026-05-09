; DESCRIPTION: Composite: . Then Places a green dot at position (231, 144). Then Creates a blue rectangular region at (174, 91) spanning 53 by 59 pixels.
; PLAN: r0=231(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=174(x), r1=91(y), r2=53(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (231, 144).
; PLAN: r0=231(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (174, 91) spanning 53 by 59 pixels.
; PLAN: r0=174(x), r1=91(y), r2=53(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 91
LDI r2, 53
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
