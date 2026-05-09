; DESCRIPTION: Places a red 27x22 rectangle at position (372, 125).
; PLAN: r0=372(x), r1=125(y), r2=27(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 125
LDI r2, 27
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
