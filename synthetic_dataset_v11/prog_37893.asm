; DESCRIPTION: Composite: . Then Creates a white rectangular region at (50, 128) spanning 65 by 109 pixels. Then Draws a cyan line from (56, 154) to (208, 81).
; PLAN: r0=50(x), r1=128(y), r2=65(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=56(x1), r1=154(y1), r2=208(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white rectangular region at (50, 128) spanning 65 by 109 pixels.
; PLAN: r0=50(x), r1=128(y), r2=65(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 128
LDI r2, 65
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (56, 154) to (208, 81).
; PLAN: r0=56(x1), r1=154(y1), r2=208(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 154
LDI r2, 208
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
