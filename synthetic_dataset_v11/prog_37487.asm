; DESCRIPTION: Draws a cyan line from (82, 59) to (123, 103).
; PLAN: r0=82(x1), r1=59(y1), r2=123(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 59
LDI r2, 123
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
