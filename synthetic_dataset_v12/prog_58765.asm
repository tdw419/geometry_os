; DESCRIPTION: Places a red 33x86 rectangle at position (422, 123).
; PLAN: r0=422(x), r1=123(y), r2=33(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 123
LDI r2, 33
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
