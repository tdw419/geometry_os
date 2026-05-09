; DESCRIPTION: Creates a green rectangular region at (365, 215) spanning 82 by 23 pixels.
; PLAN: r0=365(x), r1=215(y), r2=82(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 215
LDI r2, 82
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
