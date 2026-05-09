; DESCRIPTION: Places a red 21x116 rectangle at position (168, 125).
; PLAN: r0=168(x), r1=125(y), r2=21(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 125
LDI r2, 21
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
