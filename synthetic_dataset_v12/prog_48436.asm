; DESCRIPTION: Places a red 27x45 rectangle at position (160, 171).
; PLAN: r0=160(x), r1=171(y), r2=27(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 171
LDI r2, 27
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
