; DESCRIPTION: Places a red 66x27 rectangle at position (206, 204).
; PLAN: r0=206(x), r1=204(y), r2=66(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 204
LDI r2, 66
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
