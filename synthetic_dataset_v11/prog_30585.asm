; DESCRIPTION: Creates a cyan rectangular region at (122, 191) spanning 50 by 59 pixels.
; PLAN: r0=122(x), r1=191(y), r2=50(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 191
LDI r2, 50
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
