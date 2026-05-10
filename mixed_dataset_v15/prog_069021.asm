; DESCRIPTION: Places a red 21x38 rectangle at position (189, 117).
; PLAN: r0=189(x), r1=117(y), r2=21(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 117
LDI r2, 21
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
