; DESCRIPTION: Places a orange 76x67 rectangle at position (242, 152).
; PLAN: r0=242(x), r1=152(y), r2=76(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 152
LDI r2, 76
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
