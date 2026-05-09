; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (96, 120) spanning 96 by 40 pixels. Then Renders a red line between points (215, 173) and (235, 170).
; PLAN: r0=96(x), r1=120(y), r2=96(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=215(x1), r1=173(y1), r2=235(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (96, 120) spanning 96 by 40 pixels.
; PLAN: r0=96(x), r1=120(y), r2=96(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 120
LDI r2, 96
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (215, 173) and (235, 170).
; PLAN: r0=215(x1), r1=173(y1), r2=235(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 173
LDI r2, 235
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
