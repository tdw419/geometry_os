; DESCRIPTION: Draws a cyan line from (243, 26) to (168, 150).
; PLAN: r0=243(x1), r1=26(y1), r2=168(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 26
LDI r2, 168
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
