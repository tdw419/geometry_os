; DESCRIPTION: Places a white 27x39 rectangle at position (60, 117).
; PLAN: r0=60(x), r1=117(y), r2=27(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 117
LDI r2, 27
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
