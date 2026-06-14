; sunset_gradient.asm -- Sunset sky using horizontal color bands
; Top: deep blue -> purple -> orange/red -> dark at bottom
; Each band is 4px tall, 64 bands = 256px

; Constants
LDI r2, 256       ; screen width
LDI r3, 4         ; band height
LDI r15, 0        ; x = 0 (constant for full-width bands)

; Band 0-7: deep blue
LDI r0, 0x0B0060
LDI r1, 0
RECTF r15, r1, r2, r3, r0

LDI r0, 0x120055
LDI r1, 4
RECTF r15, r1, r2, r3, r0

LDI r0, 0x1A004A
LDI r1, 8
RECTF r15, r1, r2, r3, r0

LDI r0, 0x220040
LDI r1, 12
RECTF r15, r1, r2, r3, r0

LDI r0, 0x2A0035
LDI r1, 16
RECTF r15, r1, r2, r3, r0

LDI r0, 0x330030
LDI r1, 20
RECTF r15, r1, r2, r3, r0

LDI r0, 0x3B0028
LDI r1, 24
RECTF r15, r1, r2, r3, r0

LDI r0, 0x440022
LDI r1, 28
RECTF r15, r1, r2, r3, r0

; Band 8-15: purple to magenta
LDI r0, 0x4D0018
LDI r1, 32
RECTF r15, r1, r2, r3, r0

LDI r0, 0x550015
LDI r1, 36
RECTF r15, r1, r2, r3, r0

LDI r0, 0x5E0012
LDI r1, 40
RECTF r15, r1, r2, r3, r0

LDI r0, 0x660010
LDI r1, 44
RECTF r15, r1, r2, r3, r0

LDI r0, 0x6F000D
LDI r1, 48
RECTF r15, r1, r2, r3, r0

LDI r0, 0x77000A
LDI r1, 52
RECTF r15, r1, r2, r3, r0

LDI r0, 0x800008
LDI r1, 56
RECTF r15, r1, r2, r3, r0

LDI r0, 0x880005
LDI r1, 60
RECTF r15, r1, r2, r3, r0

; Band 16-23: magenta to red
LDI r0, 0x990005
LDI r1, 64
RECTF r15, r1, r2, r3, r0

LDI r0, 0xAA0505
LDI r1, 68
RECTF r15, r1, r2, r3, r0

LDI r0, 0xBB0805
LDI r1, 72
RECTF r15, r1, r2, r3, r0

LDI r0, 0xCC0A05
LDI r1, 76
RECTF r15, r1, r2, r3, r0

LDI r0, 0xDD0C05
LDI r1, 80
RECTF r15, r1, r2, r3, r0

LDI r0, 0xEE0E05
LDI r1, 84
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF1005
LDI r1, 88
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF1505
LDI r1, 92
RECTF r15, r1, r2, r3, r0

; Band 24-31: red to deep orange
LDI r0, 0xFF1A08
LDI r1, 96
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF200A
LDI r1, 100
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF260C
LDI r1, 104
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF2C0E
LDI r1, 108
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF3210
LDI r1, 112
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF3812
LDI r1, 116
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF3E14
LDI r1, 120
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF4416
LDI r1, 124
RECTF r15, r1, r2, r3, r0

; Band 32-39: bright orange
LDI r0, 0xFF4A18
LDI r1, 128
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF501A
LDI r1, 132
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF561C
LDI r1, 136
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF5C1E
LDI r1, 140
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF6220
LDI r1, 144
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF6822
LDI r1, 148
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF6E24
LDI r1, 152
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF7426
LDI r1, 156
RECTF r15, r1, r2, r3, r0

; Band 40-47: golden fading
LDI r0, 0xFF7A28
LDI r1, 160
RECTF r15, r1, r2, r3, r0

LDI r0, 0xFF802A
LDI r1, 164
RECTF r15, r1, r2, r3, r0

LDI r0, 0xEE7A25
LDI r1, 168
RECTF r15, r1, r2, r3, r0

LDI r0, 0xDD7422
LDI r1, 172
RECTF r15, r1, r2, r3, r0

LDI r0, 0xCC6E1F
LDI r1, 176
RECTF r15, r1, r2, r3, r0

LDI r0, 0xBB681C
LDI r1, 180
RECTF r15, r1, r2, r3, r0

LDI r0, 0xAA6219
LDI r1, 184
RECTF r15, r1, r2, r3, r0

LDI r0, 0x995C16
LDI r1, 188
RECTF r15, r1, r2, r3, r0

; Band 48-55: dark orange to brown
LDI r0, 0x885614
LDI r1, 192
RECTF r15, r1, r2, r3, r0

LDI r0, 0x775011
LDI r1, 196
RECTF r15, r1, r2, r3, r0

LDI r0, 0x664A0E
LDI r1, 200
RECTF r15, r1, r2, r3, r0

LDI r0, 0x55440C
LDI r1, 204
RECTF r15, r1, r2, r3, r0

LDI r0, 0x443E0A
LDI r1, 208
RECTF r15, r1, r2, r3, r0

LDI r0, 0x333808
LDI r1, 212
RECTF r15, r1, r2, r3, r0

LDI r0, 0x223206
LDI r1, 216
RECTF r15, r1, r2, r3, r0

LDI r0, 0x112C04
LDI r1, 220
RECTF r15, r1, r2, r3, r0

; Band 56-63: fading to dark
LDI r0, 0x0A2003
LDI r1, 224
RECTF r15, r1, r2, r3, r0

LDI r0, 0x061502
LDI r1, 228
RECTF r15, r1, r2, r3, r0

LDI r0, 0x030A01
LDI r1, 232
RECTF r15, r1, r2, r3, r0

LDI r0, 0x010500
LDI r1, 236
RECTF r15, r1, r2, r3, r0

LDI r0, 0x010300
LDI r1, 240
RECTF r15, r1, r2, r3, r0

LDI r0, 0x000200
LDI r1, 244
RECTF r15, r1, r2, r3, r0

LDI r0, 0x000100
LDI r1, 248
RECTF r15, r1, r2, r3, r0

LDI r0, 0x000100
LDI r1, 252
RECTF r15, r1, r2, r3, r0

HALT
