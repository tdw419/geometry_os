; DESCRIPTION: Places a red 65x39 rectangle at position (4, 125).
; PLAN: r0=4(x), r1=125(y), r2=65(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 125
LDI r2, 65
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
