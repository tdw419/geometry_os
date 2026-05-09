; DESCRIPTION: Creates a red rectangular region at (146, 113) spanning 104 by 87 pixels.
; PLAN: r0=146(x), r1=113(y), r2=104(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 113
LDI r2, 104
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
