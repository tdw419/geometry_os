; DESCRIPTION: Draws a cyan line from (327, 165) to (410, 18).
; PLAN: r0=327(x1), r1=165(y1), r2=410(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 165
LDI r2, 410
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
