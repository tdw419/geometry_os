; DESCRIPTION: Creates a blue rectangular region at (394, 173) spanning 87 by 37 pixels.
; PLAN: r0=394(x), r1=173(y), r2=87(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 173
LDI r2, 87
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
