; DESCRIPTION: Places a red 27x113 rectangle at position (13, 14).
; PLAN: r0=13(x), r1=14(y), r2=27(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 14
LDI r2, 27
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
