; DESCRIPTION: Renders a cyan box of size 27x61 starting at (108, 103).
; PLAN: r0=108(x), r1=103(y), r2=27(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 103
LDI r2, 27
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
