; DESCRIPTION: Draws a green line from (61, 67) to (479, 150).
; PLAN: r0=61(x1), r1=67(y1), r2=479(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 67
LDI r2, 479
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
