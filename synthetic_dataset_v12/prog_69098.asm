; DESCRIPTION: Places a green line segment connecting (307, 67) to (410, 214).
; PLAN: r0=307(x1), r1=67(y1), r2=410(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 67
LDI r2, 410
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
