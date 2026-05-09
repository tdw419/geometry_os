; DESCRIPTION: Places a orange 71x113 rectangle at position (276, 16).
; PLAN: r0=276(x), r1=16(y), r2=71(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 16
LDI r2, 71
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
