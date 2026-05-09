; DESCRIPTION: Draws a cyan line from (410, 29) to (188, 239).
; PLAN: r0=410(x1), r1=29(y1), r2=188(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 29
LDI r2, 188
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
