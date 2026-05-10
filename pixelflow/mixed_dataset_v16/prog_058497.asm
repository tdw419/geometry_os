; DESCRIPTION: Places a orange 80x72 rectangle at position (237, 27).
; PLAN: r0=237(x), r1=27(y), r2=80(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 27
LDI r2, 80
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
