; DESCRIPTION: Draws a cyan line from (197, 20) to (168, 193).
; PLAN: r0=197(x1), r1=20(y1), r2=168(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 20
LDI r2, 168
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
