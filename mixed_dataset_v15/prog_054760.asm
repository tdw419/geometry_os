; DESCRIPTION: Creates a cyan rectangular region at (174, 173) spanning 92 by 67 pixels.
; PLAN: r0=174(x), r1=173(y), r2=92(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 173
LDI r2, 92
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
