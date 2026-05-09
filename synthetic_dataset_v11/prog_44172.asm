; DESCRIPTION: Places a red 112x27 rectangle at position (123, 173).
; PLAN: r0=123(x), r1=173(y), r2=112(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 173
LDI r2, 112
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
