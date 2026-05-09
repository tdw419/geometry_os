; DESCRIPTION: Places a orange 27x37 rectangle at position (384, 215).
; PLAN: r0=384(x), r1=215(y), r2=27(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 215
LDI r2, 27
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
