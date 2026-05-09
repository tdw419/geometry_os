; DESCRIPTION: Places a cyan 109x27 rectangle at position (56, 84).
; PLAN: r0=56(x), r1=84(y), r2=109(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 84
LDI r2, 109
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
