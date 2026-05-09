; DESCRIPTION: Draws a white line from (171, 173) to (151, 146).
; PLAN: r0=171(x1), r1=173(y1), r2=151(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 173
LDI r2, 151
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
