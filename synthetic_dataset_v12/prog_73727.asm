; DESCRIPTION: Places a orange 27x50 rectangle at position (328, 64).
; PLAN: r0=328(x), r1=64(y), r2=27(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 64
LDI r2, 27
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
