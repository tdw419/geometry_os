; DESCRIPTION: Composite: . Then Renders a orange line between points (3, 147) and (173, 91). Then Creates a cyan rectangular region at (27, 86) spanning 90 by 108 pixels.
; PLAN: r0=3(x1), r1=147(y1), r2=173(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=27(x), r1=86(y), r2=90(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (3, 147) and (173, 91).
; PLAN: r0=3(x1), r1=147(y1), r2=173(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 147
LDI r2, 173
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (27, 86) spanning 90 by 108 pixels.
; PLAN: r0=27(x), r1=86(y), r2=90(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 86
LDI r2, 90
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
