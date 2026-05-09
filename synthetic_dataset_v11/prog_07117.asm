; DESCRIPTION: Composite: . Then Places a white dot at position (48, 215). Then Places a red 51x54 rectangle at position (112, 134).
; PLAN: r0=48(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=112(x), r1=134(y), r2=51(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (48, 215).
; PLAN: r0=48(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red 51x54 rectangle at position (112, 134).
; PLAN: r0=112(x), r1=134(y), r2=51(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 134
LDI r2, 51
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
