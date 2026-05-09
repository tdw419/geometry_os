; DESCRIPTION: Places a orange 27x113 rectangle at position (164, 26).
; PLAN: r0=164(x), r1=26(y), r2=27(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 26
LDI r2, 27
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
