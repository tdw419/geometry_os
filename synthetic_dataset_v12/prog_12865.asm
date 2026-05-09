; DESCRIPTION: Creates a cyan rectangular region at (328, 64) spanning 91 by 67 pixels.
; PLAN: r0=328(x), r1=64(y), r2=91(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 64
LDI r2, 91
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
