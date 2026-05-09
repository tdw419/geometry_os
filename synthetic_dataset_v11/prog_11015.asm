; DESCRIPTION: Creates a cyan rectangular region at (54, 173) spanning 49 by 56 pixels.
; PLAN: r0=54(x), r1=173(y), r2=49(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 173
LDI r2, 49
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
