; DESCRIPTION: Composite: . Then Draws a white circle centered at (115, 173) with radius 62. Then Draws a cyan line from (95, 22) to (198, 255).
; PLAN: r0=115(x), r1=173(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=95(x1), r1=22(y1), r2=198(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (115, 173) with radius 62.
; PLAN: r0=115(x), r1=173(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 173
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (95, 22) to (198, 255).
; PLAN: r0=95(x1), r1=22(y1), r2=198(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 22
LDI r2, 198
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
