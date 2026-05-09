; DESCRIPTION: Places a orange 72x64 rectangle at position (211, 48).
; PLAN: r0=211(x), r1=48(y), r2=72(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 48
LDI r2, 72
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
