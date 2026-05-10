; DESCRIPTION: Draws a cyan line from (284, 103) to (233, 61).
; PLAN: r0=284(x1), r1=103(y1), r2=233(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 103
LDI r2, 233
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
